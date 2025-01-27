package cc.ryanc.halo.web.controller.admin;

import cc.ryanc.halo.model.domain.Logs;
import cc.ryanc.halo.model.domain.Post;
import cc.ryanc.halo.model.domain.User;
import cc.ryanc.halo.model.dto.HaloConst;
import cc.ryanc.halo.model.dto.LogsRecord;
import cc.ryanc.halo.model.dto.RespStatus;
import cc.ryanc.halo.service.LogsService;
import cc.ryanc.halo.service.PostService;
import cc.ryanc.halo.service.UserService;
import cc.ryanc.halo.util.HaloUtil;
import cc.ryanc.halo.web.controller.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author : RYAN0UP
 * @date : 2017/12/5
 * @version : 1.0
 * description: 后台首页控制器
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController{

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @Autowired
    private LogsService logsService;

    @Autowired
    private HttpServletRequest request;

    /**
     * 请求后台页面
     * @return freemarker
     */
    @GetMapping(value = {"","/index"})
    public String index(Model model,HttpSession session){
        //查询文章条数
        Integer postCount = postService.findAllPosts().size();
        model.addAttribute("postCount",postCount);
        //查询最新的文章
        List<Post> postsLatest = postService.findPostLatest();
        model.addAttribute("postTopFive",postsLatest);
        model.addAttribute("options", HaloConst.OPTIONS);
        model.addAttribute("mediaCount",HaloConst.ATTACHMENTS.size());
        List<Logs> logsLatest = logsService.findLogsLatest();
        model.addAttribute("logs",logsLatest);
        this.getNewComments(session);
        return "admin/index";
    }

    /**
     * 处理跳转到登录页的请求
     * @return freemarker
     */
    @GetMapping(value = "/login")
    public String login(HttpSession session){
        User user = (User) session.getAttribute("user");
        //如果session存在，跳转到后台首页
        if(null!=user){
            return "redirect:/admin";
        }
        return "admin/login";
    }

    /**
     * 验证登录信息
     * @param loginName loginName
     * @param loginPwd loginPwd
     * @param session session
     * @return String
     */
    @PostMapping(value = "/getLogin")
    @ResponseBody
    public String getLogin(@ModelAttribute("loginName") String loginName,
                           @ModelAttribute("loginPwd") String loginPwd,
                           HttpSession session){
        try {
            User user = userService.userLogin(loginName, loginPwd);
            if(null!=user){
                session.setAttribute("user",user);
                log.info("用户["+user.getUserName()+"]登录成功！");
                logsService.saveByLogs(new Logs(LogsRecord.LOGIN,LogsRecord.LOGIN_SUCCESS,HaloUtil.getIpAddr(request), HaloUtil.getDate()));
                return RespStatus.SUCCESS;
            }else{
                logsService.saveByLogs(new Logs(LogsRecord.LOGIN,LogsRecord.LOGIN_ERROR,HaloUtil.getIpAddr(request),new Date()));
            }
        }catch (Exception e){
            log.error("登录失败！："+e.getMessage());
        }
        return RespStatus.ERROR;
    }

    /**
     * 退出登录 销毁session
     * @param session session
     * @return string
     */
    @GetMapping(value = "/logOut")
    public String logOut(HttpSession session){
        User user = (User) session.getAttribute("user");
        log.info("用户["+user.getUserName()+"]退出登录");
        logsService.saveByLogs(new Logs(LogsRecord.LOGOUT,user.getUserName(),HaloUtil.getIpAddr(request),HaloUtil.getDate()));
        session.invalidate();
        return "redirect:/admin/login";
    }

    /**
     * 查看所有日志
     * @param model model
     * @param page page
     * @param size size
     * @return string
     */
    @GetMapping(value = "/logs")
    public String logs(Model model,
                       @RequestParam(value = "page",defaultValue = "0") Integer page,
                       @RequestParam(value = "size",defaultValue = "10") Integer size){
        try {
            Sort sort = new Sort(Sort.Direction.DESC,"logId");
            Pageable pageable = new PageRequest(page,size,sort);
            Page<Logs> logs = logsService.findAllLogs(pageable);
            model.addAttribute("logs",logs);
        }catch (Exception e){
            log.error("未知错误："+e.getMessage());
        }
        return "admin/widget/_logs-all";
    }

    @GetMapping(value = "/logs/clear")
    public String logsClear(){
        try {
            logsService.removeAllLogs();
        }catch (Exception e){
            log.error("未知错误："+e.getMessage());
        }
        return "redirect:/admin";
    }
}
