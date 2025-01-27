package cc.ryanc.halo.web.controller.admin;

import cc.ryanc.halo.model.dto.HaloConst;
import cc.ryanc.halo.model.dto.RespStatus;
import cc.ryanc.halo.service.OptionsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

/**
 * @author : RYAN0UP
 * @date : 2017/12/13
 * @version : 1.0
 * description : 设置选项控制器
 */
@Slf4j
@Controller
@RequestMapping("/admin/option")
public class OptionController {

    @Autowired
    private OptionsService optionsService;

    /**
     * 请求跳转到option页面并完成渲染
     * @return freemarker
     */
    @GetMapping
    public String options(Model model){
        model.addAttribute("options", HaloConst.OPTIONS);
        log.info("所有的设置选项："+HaloConst.OPTIONS);
        return "admin/option";
    }

    /**
     * 保存设置选项
     * @param options options
     */
    @PostMapping(value = "/save")
    @ResponseBody
    public String saveOptions(@RequestParam Map<String,String> options){
        try {
            optionsService.saveOptions(options);
            HaloConst.OPTIONS.clear();
            HaloConst.OPTIONS = optionsService.findAllOptions();
            log.info("所保存的设置选项列表："+options);
            return RespStatus.SUCCESS;
        }catch (Exception e){
            log.error("未知错误：",e.getMessage());
            return RespStatus.ERROR;
        }
    }
}
