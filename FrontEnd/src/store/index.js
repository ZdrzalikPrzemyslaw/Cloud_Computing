// tutaj tworzymy Vuex Store, które posłuży nam do uwierzytelniania.

import { createStore } from "vuex";
import {auth} from './auth.module';

const store = createStore({
    state:{
        name: "Vue"
    },
    modules: {
        auth
    }
});

export default store
