package com.ruoyi.common.core.redis;

import org.redisson.api.RLock;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import com.ruoyi.common.utils.spring.SpringUtils;
import lombok.extern.slf4j.Slf4j;
import java.util.concurrent.TimeUnit;

/**
 * redis锁工具类
 *
 * @author ruoyi
 */
@Component
@Slf4j
public class RedisLock implements InitializingBean {

	@Autowired
	private RedissonClientBuilder redissonClientBuilder;

	private RedissonClient redissonClient;

	@Override
	public void afterPropertiesSet() throws Exception {
		redissonClient = redissonClientBuilder.build();
		log.info("redis锁加载成功");
	}

	/**
	 * 获取锁
	 *
	 * @param lockKey 锁实例key
	 * @return 锁信息
	 */
	public RLock getRLock(String lockKey) {
		return redissonClient.getLock(lockKey);
	}

	/**
	 * 加锁 , 同一线程可重入
	 *
	 * @param lockKey 锁实例key
	 * @return 锁信息
	 */
	public RLock lock(String lockKey) {
		RLock lock = getRLock(lockKey);
		lock.lock();
		return lock;
	}

	/**
	 * 加锁
	 *
	 * @param lockKey   锁实例key
	 * @param leaseTime 上锁后自动释放锁时间
	 * @return true=成功；false=失败
	 */
	public Boolean tryLock(String lockKey, long leaseTime) {
		return tryLock(lockKey, 0, leaseTime, TimeUnit.SECONDS);
	}

	/**
	 * 加锁
	 *
	 * @param lockKey   锁实例key
	 * @param leaseTime 上锁后自动释放锁时间
	 * @param unit      时间颗粒度
	 * @return true=加锁成功；false=加锁失败
	 */
	public Boolean tryLock(String lockKey, long leaseTime, TimeUnit unit) {
		return tryLock(lockKey, 0, leaseTime, unit);
	}

	/**
	 * 加锁
	 *
	 * @param lockKey   锁实例key
	 * @param waitTime  最多等待时间
	 * @param leaseTime 上锁后自动释放锁时间
	 * @param unit      时间颗粒度
	 * @return true=加锁成功；false=加锁失败
	 */
	public Boolean tryLock(String lockKey, long waitTime, long leaseTime, TimeUnit unit) {
		RLock rLock = getRLock(lockKey);
		boolean tryLock = false;
		try {
			tryLock = rLock.tryLock(waitTime, leaseTime, unit);
		} catch (InterruptedException e) {
			return false;
		}
		return tryLock;
	}

	/**
	 * 释放锁
	 *
	 * @param lockKey 锁实例key
	 */
	public void unlock(String lockKey) {
		RLock lock = getRLock(lockKey);
		lock.unlock();
	}

	/**
	 * 释放锁
	 *
	 * @param lock 锁信息
	 */
	public void unlock(RLock lock) {
		lock.unlock();
	}
	
	

	@SuppressWarnings("unchecked")
	public void waitLock(String key, int second) {
		try {
			RSemaphore semaphore = redissonClient.getSemaphore(key);
			if (semaphore == null) {
				return;
			}
			semaphore.trySetPermits(1);
			try {
				semaphore.acquire();
			} catch (InterruptedException e) {
				e.printStackTrace();
				unWaitLock(key);
			} finally {
				SpringUtils.getBean(RedisTemplate.class).expire(key, second , TimeUnit.SECONDS) ;
			}
		} catch (Exception e) {
			log.error("WaitLock加锁错误 {} {}", key, second, e);
		}
	}

	public void unWaitLock(String key) {
		try {
			RSemaphore semaphore = redissonClient.getSemaphore(key);
			if (semaphore != null) {
				semaphore.release();
			}
		} catch (Exception e) {
			log.error("WaitLock释放锁错误 {}", key, e);
		}
	}
}
