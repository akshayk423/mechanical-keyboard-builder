package com.mkbb.app.rest.Controllers;

import com.mkbb.app.rest.Models.*;
import com.mkbb.app.rest.Repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ApiControllers {

    @Autowired
    private UserRepo userRepo;
    @Autowired
    private KeyboardPartRepo kbRepo;
    @Autowired
    private AccessoriesRepo acRepo;
    @Autowired
    private BookmarksRepo bmRepo;
    @Autowired
    private KeyboardCaseRepo caseRepo;
    @Autowired
    private KeycapsRepo capsRepo;
    @Autowired
    private ModRepo mdRepo;
    @Autowired
    private PartlistRepo plRepo;
    @Autowired
    private PCBRepo pcbRepo;
    @Autowired
    private PrebuiltRepo pbRepo;
    @Autowired
    private ReportedRepo rpRepo;
    @Autowired
    private StablizerRepo stabRepo;
    @Autowired
    private SwitchRepo switchRepo;

    @GetMapping(value = "/")
    public String getPage(){
        return "Restful API for MKBB CS157A TEAM 4";
    }

    @GetMapping(value = "/users")
    public List<User> getUsers(){
        return userRepo.findAll();
    }

    @GetMapping(value = "/keyboardparts")
    public List<KeyboardPart> getKeyboardParts(){return kbRepo.findAll();}

    @GetMapping(value = "/accessories")
    public List<Accessories> getAccessories(){return acRepo.findAll();}

    @GetMapping(value = "/bookmarks")
    public List<Bookmarks> getBookmarks(){return bmRepo.findAll();}

    @GetMapping(value = "/cases")
    public List<KeyboardCases> getCases(){return caseRepo.findAll();}

    @GetMapping(value = "/keycaps")
    public List<Keycaps> getKeycaps(){return capsRepo.findAll();}

    @GetMapping(value = "/mods")
    public List<Mods> getMods(){return mdRepo.findAll();}

    @GetMapping(value = "/partlists")
    public List<Partlist> getPartlist(){return plRepo.findAll();}

    @GetMapping(value = "/pcb")
    public List<PCB> getPCB(){return pcbRepo.findAll();}

    @GetMapping(value = "/prebuilts")
    public List<Prebuilt> getPrebuilt(){return pbRepo.findAll();}

    @GetMapping(value = "/reports")
    public List<Reported> getReports(){return rpRepo.findAll();}

    @GetMapping(value = "/stabs")
    public List<Stablizers> getStabilizers(){return stabRepo.findAll();}

    @GetMapping(value = "/switches")
    public List<Switches> getSwitches(){return switchRepo.findAll();}

}
