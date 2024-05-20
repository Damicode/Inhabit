package com.inhabit.webApp.REPOSITORY;

import com.inhabit.webApp.MODELE.Participants;
import jakarta.persistence.Id;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ParticipantsRepo extends JpaRepository <Participants, Id>  {
    List<Participants> findById(Integer integer);
}
