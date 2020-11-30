package tech.czatmat.app.CzatMatApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import tech.czatmat.app.CzatMatApp.login.VerifyUser;
import tech.czatmat.app.CzatMatApp.users.UserRepository;
import tech.czatmat.app.CzatMatApp.users.Users;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/login")
@CrossOrigin(origins = "*", allowedHeaders = "*")
// TODO: 27.11.2020 fix class
public class LoginController {
    // TODO: 27.11.2020 https://bezkoder.com/spring-boot-jwt-authentication/
    @Autowired
    private PasswordEncoder passwordEncoder;

    private final UserRepository userRepository;

    public LoginController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // TODO: 27.11.2020 Return token
    @RequestMapping(value = "", method = RequestMethod.POST, produces = "application/json")
    public void loginUser(@RequestBody Users users, HttpServletResponse response) {
        System.out.println(users);
        if (!userRepository.existsByUsername(users.getUsername())) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        if(VerifyUser.Verify(users.getUsername(), users.getPassword(), userRepository, passwordEncoder)){
            response.setStatus(HttpServletResponse.SC_ACCEPTED);
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }


    @RequestMapping(value = "/przyklad", method = RequestMethod.GET, produces = "application/json")
    public String getPrzyklad() {
        return "Siema Login";
    }

}