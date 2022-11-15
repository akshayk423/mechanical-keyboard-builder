package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Partlist;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PartlistRepo extends JpaRepository<Partlist,String> {
}
