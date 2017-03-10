package com.finartz.controller;

import org.apache.log4j.Logger;
import com.finartz.model.User;
import com.finartz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by ae on 08.03.2017.
 */
@Controller
public class HomeController {
    private static final Logger logger = Logger.getLogger(HomeController.class);

    @Autowired
    UserService userService;

    @RequestMapping(value="/", method = RequestMethod.GET)
    public ModelAndView home(){
        //logs debug message
        if(logger.isDebugEnabled()){
            logger.debug("home page is executed!");
        }

        ModelAndView model = new ModelAndView("home");
        model.addObject("listUser", userService.listUser());
        model.addObject("userForm", new User());
        return model;

        //return "home";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("userForm") User user){
        if(user.getId() != null && !(user.getId().trim().equals(""))){
            if(logger.isDebugEnabled()){
                logger.debug("user is updated!");
            }
            userService.update(user);
        }else{

            if(logger.isDebugEnabled()){
                logger.debug("new user is added!");
            }
            userService.add(user);
        }

        return "redirect:/";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    @ResponseBody public User update(@PathVariable("id") String id){
        User user = userService.findUserById(id);
        return user;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") String id){
        User user = userService.findUserById(id);
        userService.delete(user);

        if(logger.isDebugEnabled()){
            logger.debug("user is deleted!");
        }

        return "redirect:/";
    }

    /*@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView add(){
        ModelAndView model = new ModelAndView("home");
        model.addObject("userForm", new User());
        return model;
    }*/

}
