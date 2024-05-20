package com.inhabit.webApp.SERVICES;

import com.inhabit.webApp.MODELE.Participants;
import com.inhabit.webApp.REPOSITORY.ParticipantsRepo;
import jakarta.persistence.Entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class PaticipantController {



    @Autowired
    private ParticipantsRepo participantsRepo;

    @Autowired
    private Participants participants;

    public PaticipantController(ParticipantsRepo participantsRepo) {this.participantsRepo = participantsRepo;
    }

    public PaticipantController(Participants participants) {this.participants = participants;
    }


    @RequestMapping(value = "/hello",method = RequestMethod.POST)
    public String helloWorld(ModelMap modelMap, Participants participants){

        List<Participants> mylist = participantsRepo.findAll();
        //List<Participants> object = new ArrayList<>();




//        List<String> mylist = Arrays.asList(
//                participants.getFirsName(),
//                participants.getMidleName(),
//                participants.getLastName()
//
//
//        );
        modelMap.addAttribute("mylist",mylist);
        modelMap.addAttribute("participants", participants);

//        System.out.print("LIST----" + mylist);
        System.out.print("LIST Part :" + participants);


        return "index";

    }


    @GetMapping("/participants")
    public String getAllParticipants(ModelMap model, Participants participants){


        model.addAttribute("participants", participants);
        return "participants";

    }

    public PaticipantController() {}
}
