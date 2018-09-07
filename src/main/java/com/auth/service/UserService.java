package com.auth.service;

import com.auth.model.User;
import com.auth.model.UserPrincipal;
import com.auth.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Service
public class UserService implements UserDetailsService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


  /*  @PostConstruct
    public void init() {
        userRepository.findByUsername("user").ifPresent(user -> {
            user.setPassword(new BCryptPasswordEncoder().encode("password"));
            userRepository.save(user);
        });
        userRepository.findByUsername("admin").ifPresent(user -> {
            user.setPassword(new BCryptPasswordEncoder().encode("password"));
            userRepository.save(user);
        });
    }*/

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        final User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User with " + username + "not found"));
        return new UserPrincipal(user);
    }
}
