/* global Vue, VueRouter, axios */

var AllUsersPage = {
  template: "#all-users-page",
  data: function() {
    return {
      users: []
    };
  },
  created: function() {
    axios.get('/api/users').then(function(response) {
      this.users = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var AllExercisesPage = {
  template: "#all-exercises-page",
  data: function() {
    return {
      exercises: []
    };
  },
  created: function() {
    axios.get('/api/exercises').then(function(response) {
      this.exercises = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Fit With Me!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      username: "",
      first_name: "",
      last_name: "",
      age: "",
      height: "",
      weight: "",
      city: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        username: this.username,
        first_name: this.first_name,
        last_name: this.last_name,
        age: this.age,
        height: this.height,
        weight: this.weight,
        city: this.city,
        email: this.email,
        password: this.password,
        passwordConfirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ExercisePage = {
  template: "#exercise-page",
  data: function() {
    return {
      exercise: {
        title: "",
        exercise_type: "",
        target_muscle: "",
        required_equipment: "",
        difficulty_level: "",
      },
      instructions: [],
      images: []
    };
  },
  created: function() {
    axios.get("/api/exercises/" + this.$route.params.id).then(function(response) {
      this.exercise = response.data;
      this.instructions = response.data.instructions;
      this.images = response.data.images;
      console.log(response.data);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var WorkoutShowPage = {
  template: "#workout-show-page",
  data: function() {
    return {
      name: "",
      target_goal: "",
      status: "",
      exercises: [
        {
          title: "",
          exercise_type: "",
          target_muscle: "",
          required_equipment: "",
          difficulty_level: "",
          instructions: [],
          images: []
        }
      ],
    };
  },
  created: function() {
    axios.get("/api/workouts/" + this.$route.params.id).then(function(response) {
      console.log('in workout show page create function');
      console.log(response.data);
      this.name = response.data.name;
      this.target_goal = response.data.target_goal;
      this.status = response.data.status;
      this.exercises = response.data.exercises;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var UserHomePage = {
  template: "#user-home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      user: {
        username: "",
        first_name: "",
        last_name: "",
        age: "",
        height: "",
        weight: "",
        city: "",
        email: ""
      }
    };
  },
  created: function() {
    axios.get("/api/users/" + this.$route.params.id).then(function(response) {
      this.user = response.data;
      console.log(response.data);
      router.push("/users/" + response.data.id);
    }.bind(this));
  },
  methods: {
    createFitGroup: function() {
      // axios.get('/api/workouts').then(function(response) {
      router.push("/fit_groups/new");
      // }.bind(this));
    }
  },
  computed: {}
};

var NewFitGroupPage = {
  template: "#new-fitgroup-page",
  data: function() {
    return {
      name: [],
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var fitGroupParams = {
        name: this.name
      };
      axios
        .post("/api/fit_groups", fitGroupParams)
        .then(function(response) {
          console.log(response);
          console.log(response.data);
          router.push("/fit_groups/" + response.data.id);
        }.bind(this));
    }
  }
};

var WorkoutsIndexPage = {
  template: "#all-workouts-page",
  data: function() {
    return {
      workouts: [],
      exercises: [
        {
          title: "",
          exercise_type: "",
          target_muscle: "",
          required_equipment: "",
          difficulty_level: "",
          instructions: [],
          images: []
        }
      ],
      selectedWorkout: {
        name: "",
        target_goal: "",
        exercises: [
          {
            title: "",
            exercise_type: "",
            target_muscle: "",
            required_equipment: "",
            difficulty_level: "",
            instructions: [],
            images: []
          }
        ]
      }
    };
  },
  created: function() {
    axios.get('/api/workouts').then(function(response) {
      console.log('in workout index create action');
      console.log(response.data);
      this.workouts = response.data;
    }.bind(this));
  },
  methods: {
    changeWorkout: function(inputWorkout) {
      this.selectedWorkout = inputWorkout;
    },
    addSelectedWorkoutToFitGroup: function(inputWorkout) {
      var workoutParams = inputWorkout;
      console.log(workoutParams);
      axios.post("/api/shared_workouts", workoutParams).then(function(response) {

        router.push("/fit_groups/" + this.$route.params.id);
      }.bind(this));
    }
  },
  computed: {}
};

var FitGroupShowPage = {
  template: "#fitgroup-show-page",
  data: function() {
    return {
      name: "",
      captain: {
        id: "",
        first_name: "",
        city: ""
      },
      status: "",
      workouts: []
    };
  },
  created: function() {
    axios.get("/api/fit_groups/" + this.$route.params.id).then(function(response) {
      console.log('in fit group show page create function');
      console.log(response.data);

      this.name = response.data.name;
      this.captain = response.data.captain;
      console.log(this.captain);
      this.status = response.data.status;
      axios.get("/api/captains/" + this.captain.id).then(function(response) {
        this.captain = response.data;
      }.bind(this));
    }.bind(this));
  },
  methods: {
    addWorkoutToFitGroup: function() {
      axios.patch("/api/fit_groups/" + this.$route.params.id).then(function(response) {
        console.log('in workout add function');
        console.log(response.data);
        axios.post("/api/shared_workouts").then(function(response) {
          console.log('in second axios request inside addworkout function');
          console.log(response.data);
          router.push("/fit_groups/" + this.$route.params.id);
        }.bind(this));
      }.bind(this));
    }
  },
  computed: {}
};

var NewWorkoutPage = {
  template: "#new-workout-page",
  data: function() {
    return {
      exercises: [],
      selectedExercise: {
        title: "",
        exercise_type: "",
        target_muscle: "",
        required_equipment: "",
        difficulty_level: ""
      },
      cartedExercises: [
        {
          id: ""
        },
        {
          exercise:  {
            id: "",
            title: "",
            exercise_type: "",
            target_muscle: "",
            required_equipment: "",
            difficulty_level: ""
          }
        }
      ],
      name: "",
      target_goal: "",
      errors: []
    };
  },
  created: function() {
    axios.get('/api/carted_exercises').then(function(response) {
      this.cartedExercises = response.data;
    }.bind(this));
    axios.get('/api/exercises').then(function(response) {
      this.exercises = response.data;
    }.bind(this));
  },
  methods: {
    changeExercise: function(inputExercise) {
      this.selectedExercise = inputExercise;
    },
    addToCartedExercises: function(inputExercise) {
      var exerciseParams = {
        exercise_id: inputExercise.id,

      };
      axios.post("/api/carted_exercises", exerciseParams).then(function(response) {
        console.log(response.data);
        console.log('that was response.data');
        console.log(response.config.data);
        console.log('that was response.config.data');
        this.cartedExercises.push(...response.config.data);
        router.push("/workouts/new");
      }.bind(this));

      axios.get("/api/carted_exercises").then(function(response) {
        console.log('in carted_exercises get request');
        console.log(response.data);
        this.cartedExercises = response.data;
      }.bind(this));
    },
    createWorkout: function() {
      console.log('in createWorkout function');
      var workoutParams = {
        name: this.name,
        target_goal: this.target_goal,
        exercises: this.cartedExercises
      };
      console.log(workoutParams);
      axios.post("/api/workouts", workoutParams).then(function(response) {
        console.log('response.data.id below');
        console.log(response.data.id);

        router.push("/workouts/" + response.data.id);
      }.bind(this));
    }
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/users/:id", component: UserHomePage },
    { path: "/exercises", component: AllExercisesPage },
    { path: "/users", component: AllUsersPage },
    { path: "/exercises/:id", component: ExercisePage },
    { path: "/workouts/new", component: NewWorkoutPage },
    { path: "/workouts", component: WorkoutsIndexPage },
    { path: "/workouts/:id", component: WorkoutShowPage },
    { path: "/fit_groups/new", component: NewFitGroupPage },
    { path: "/fit_groups/:id", component: FitGroupShowPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});