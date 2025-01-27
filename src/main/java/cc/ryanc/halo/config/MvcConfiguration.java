package cc.ryanc.halo.config;

import cc.ryanc.halo.service.OptionsService;
import cc.ryanc.halo.web.interceptor.LoginInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.*;

/**
 * @author : RYAN0UP
 * @version : 1.0
 * @date : 2018/1/2
 * description:
 */
@Slf4j
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "cc.ryanc.halo.web.controller")
@PropertySource(value = "classpath:application.yaml",ignoreResourceNotFound = true,encoding = "UTF-8")
public class MvcConfiguration extends WebMvcConfigurerAdapter {

    @Autowired
    private LoginInterceptor loginInterceptor;

    @Autowired
    private OptionsService optionsService;

    /**
     * 注册拦截器
     * @param registry registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor).addPathPatterns("/admin/**").excludePathPatterns("/admin/login").excludePathPatterns("/admin/getLogin");
    }

    /**
     * 配置静态资源路径
     * @param registry registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/**").addResourceLocations("classpath:/templates/themes/")
                                                        .addResourceLocations("classpath:/robots.txt");
        registry.addResourceHandler("/upload/**").addResourceLocations("classpath:/upload/");
    }


}
