package com.mkbb.app.rest.Repo;

import com.mkbb.app.rest.Models.Bookmarks;
import org.springframework.data.jpa.repository.JpaRepository;



public interface BookmarksRepo extends JpaRepository<Bookmarks,String> {
}
