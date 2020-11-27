package tech.czatmat.app.CzatMatApp.login;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/login")
// TODO: 27.11.2020 fix class
public class LoginController {

    private final UserRepository userRepository;

    public LoginController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    public Boolean loginUser(@RequestBody User user) {
        if (!userRepository.existsByLogin(user.getLogin())) {
            return false;
        }
        return VerifyUser.mockVerify(user.getLogin(), user.getPassword());
    }


    @RequestMapping(value = "/przyklad", method = RequestMethod.GET, produces = "application/json")
    public String getPrzyklad() {
        return "Siema Login";
    }

}
