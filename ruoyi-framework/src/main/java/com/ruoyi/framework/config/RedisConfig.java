package com.ruoyi.framework.config;

import com.ruoyi.common.config.RuoYiConfig;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/**
 * redis配置
 *
 * @author ruoyi
 */
@Configuration
@EnableCaching
public class RedisConfig extends CachingConfigurerSupport
{
    @Bean
    @DependsOn("ruoyiConfig")
    @SuppressWarnings(value = { "unchecked", "rawtypes" })
    public RedisTemplate<Object, Object> redisTemplate(RedisConnectionFactory connectionFactory)
    {
        RedisTemplate<Object, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(connectionFactory);

        FastJson2JsonRedisSerializer serializer = new FastJson2JsonRedisSerializer(Object.class);

        // 使用RedisKeySerializer来序列化和反序列化redis的key值
        template.setKeySerializer(new RedisKeySerializer());
        template.setValueSerializer(serializer);

        // Hash的key也采用RedisKeySerializer的序列化方式
        template.setHashKeySerializer(new RedisKeySerializer());
        template.setHashValueSerializer(serializer);

        template.afterPropertiesSet();
        return template;
    }

    @Bean
    public DefaultRedisScript<Long> limitScript()
    {
        DefaultRedisScript<Long> redisScript = new DefaultRedisScript<>();
        redisScript.setScriptText(limitScriptText());
        redisScript.setResultType(Long.class);
        return redisScript;
    }

    /**
     * 限流脚本
     */
    private String limitScriptText()
    {
        return "local key = KEYS[1]\n" +
                "local count = tonumber(ARGV[1])\n" +
                "local time = tonumber(ARGV[2])\n" +
                "local current = redis.call('get', key);\n" +
                "if current and tonumber(current) > count then\n" +
                "    return tonumber(current);\n" +
                "end\n" +
                "current = redis.call('incr', key)\n" +
                "if tonumber(current) == 1 then\n" +
                "    redis.call('expire', key, time)\n" +
                "end\n" +
                "return tonumber(current);";
    }
}


class RedisKeySerializer implements RedisSerializer<String> {

    /**
     * 编码格式
     */
    private final Charset charset;

    /**
     * 前缀
     */
    private final String KEY_PREFIX = RuoYiConfig.getKeyPrefix();

    public RedisKeySerializer() {
        this(StandardCharsets.UTF_8);
    }

    public RedisKeySerializer(Charset charset) {
        this.charset = charset;
    }

    @Override
    public byte[] serialize(String cacheKey) {
        String key = cacheKey;
        assert cacheKey != null;
        int indexOf = cacheKey.indexOf(KEY_PREFIX);
        if (indexOf == -1){
            key = KEY_PREFIX + cacheKey;
        }
        return key.getBytes(charset);
    }
    @Override
    public String deserialize(byte[] bytes) throws SerializationException {
        String cacheKey = new String(bytes, charset);
        int indexOf = cacheKey.indexOf(KEY_PREFIX);
        if (indexOf == -1) {
            cacheKey = KEY_PREFIX + cacheKey;
        }
        return cacheKey;
    }

}
