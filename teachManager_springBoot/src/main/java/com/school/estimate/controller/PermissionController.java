package com.school.estimate.controller;

import com.alibaba.fastjson.JSONArray;
import com.school.estimate.domain.Permission;
import com.school.estimate.domain.Student;
import com.school.estimate.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/manage/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String gotoPermission() {
        return "/manage/permission/permissionList";
    }

    @RequestMapping(value = "/permissionList")
    @ResponseBody
    public String permissionList() {
        List<Permission> allPermission = permissionService.findAllPermission();
        Map<String, Object> map = new HashMap<>();
        map.put("code", "0");
        map.put("msg", "ok");
        map.put("data", allPermission);
        map.put("count", allPermission.size());
        String jsonString = JSONArray.toJSONString(map);
        return jsonString;
    }

    @RequestMapping(value = "addPermission", method = RequestMethod.GET)
    public String gotoAddPermission() {
        return "/manage/permission/addPermission";
    }

    @RequestMapping(value = "addPermission", method = RequestMethod.POST)
    @ResponseBody
    public String savePermission(Permission permission) {
        Long aLong = permissionService.savePermission(permission);
        if(aLong < 1){
            return aLong.toString();
        }

        permission.setDataID(aLong.intValue());
        aLong = permissionService.updatePermission(permission);
        return aLong.toString();
    }

    @RequestMapping(value = "permissionSelect", method = RequestMethod.POST)
    @ResponseBody
    public String permissionSelect(Long permissionLevel) {

        List list = new ArrayList();
        List<Permission> permissionFa = permissionService.getPermissionByLevel(null, new Long(1));
        if(permissionFa != null && permissionFa.size() > 0){
            for (Permission permission : permissionFa) {
                Map permissionMap = new LinkedHashMap();
                permissionMap.put("id", permission.getId());
                permissionMap.put("name", permission.getName());
                permissionMap.put("level",permission.getPermissionLevel());
//                permissionMap.put("spread", "false");
                //获取child
                List childList = getChild(permission.getId().longValue());
                if (childList != null && childList.size() > 0) {
                    permissionMap.put("children", childList);
                }

                list.add(permissionMap);

            }
        }
        String selectJson = JSONArray.toJSONString(list);
        return selectJson;
    }

    @RequestMapping(value = "updatePermission",method = RequestMethod.GET)
    public String gotoUpdate(Long id, Model model){
        Permission permission = permissionService.findPermissionById(id);
        int parentId = permission.getParentId();
        String far;
        if(parentId == 0){
            far = "0:NA";
        }else{
            Permission farPermission = permissionService.findPermissionById(permission.getParentId().longValue());
            far = farPermission.getParentId() + ":" + farPermission.getName();
        }

        model.addAttribute("permission",permission);
        model.addAttribute("far",far);
        return "/manage/permission/updatePermission";
    }

    @RequestMapping(value = "updatePermission",method = RequestMethod.POST)
    @ResponseBody
    public String updatePermission(Permission permission){
        return permissionService.updatePermission(permission).toString();

    }

    private List getChild(Long farId) {
        List list = new ArrayList();
        List<Permission> childPermission = permissionService.getPermissionByLevel(farId, null);
        if (childPermission != null && childPermission.size() > 0) {
            for (Permission permission : childPermission) {
                Map permissionMap = new LinkedHashMap();
                permissionMap.put("id", permission.getId());
                permissionMap.put("name", permission.getName());
                permissionMap.put("level",permission.getPermissionLevel());
                //获取child
                List childMap = getChild(permission.getId().longValue());
                if (childMap != null && childMap.size() > 0) {
                    permissionMap.put("children", childMap);
                }
                list.add(permissionMap);
            }
        } else {
            return null;
        }
        return list;
    }

}
