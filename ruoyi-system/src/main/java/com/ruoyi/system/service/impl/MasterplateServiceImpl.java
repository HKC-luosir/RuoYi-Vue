package com.ruoyi.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.service.IMasterplateService;
import com.ruoyi.system.utils.OpenApiAuthUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Service
public class MasterplateServiceImpl implements IMasterplateService {

    private static final Logger log = LoggerFactory.getLogger(MasterplateServiceImpl.class);

    @Autowired
    private RestTemplate restTemplate;

    /**
     * 金融产品相关接口的域名
     */
    @Value("${bankapi.domain}")
    private String domain;

    /**
     * appKey
     */
    @Value("${bankapi.appKey}")
    private String appKey;

    /**
     * appSecret
     */
    @Value("${bankapi.appSecret}")
    private String appSecret;


    @Override
    public AjaxResult sendMasterplate(Object body) {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        assert servletRequestAttributes != null;
        HttpServletRequest request = servletRequestAttributes.getRequest();
        String masterplateType = request.getHeader("masterplate_type");
        String method = request.getHeader("method");
        String url = getUrl(masterplateType);
        HttpHeaders headers = OpenApiAuthUtil.generateAuthHeaders(appKey, appSecret);
        HttpEntity<AjaxResult> httpEntity = new HttpEntity<>(null, headers);
        ParameterizedTypeReference<AjaxResult> reference =
                new ParameterizedTypeReference<AjaxResult>() {
                };
        ResponseEntity<AjaxResult> responseEntity = restTemplate.exchange(url,
                Objects.requireNonNull(HttpMethod.resolve(method)), httpEntity, reference);
        return responseEntity.getBody();
    }

    /**
     * 获取url
     * @param masterplateType
     * @return
     */
    private String getUrl(String masterplateType) {
        String path = "";
        switch (masterplateType) {
            case "1":
                path = "";
                break;
            case "2":
                break;
            default:
                break;
        }
        return domain + path;
    }



    @Override
    public Object ocr(String img) {
        String host = "https://bizlicense.market.alicloudapi.com";
        String path = "/rest/160601/ocr/ocr_business_license.json";
        String appcode = "a731eaeea66742e9b9cef56f9fa17bd6";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "APPCODE " + appcode);
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);

        MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
        requestBody.add("image", img);

        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(host + path);

        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.exchange(builder.build().toUri(), HttpMethod.POST, requestEntity, String.class);

        if (responseEntity.getStatusCode() != HttpStatus.OK) {
            throw new RuntimeException("Failed with HTTP status code: " + responseEntity.getStatusCodeValue());
        }
        log.info(responseEntity.getBody());
        return JSONObject.parseObject(responseEntity.getBody());
    }



}
