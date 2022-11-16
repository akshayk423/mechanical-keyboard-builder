package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Keycaps;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KeycapsRepo extends JpaRepository<Keycaps, String> {
}
