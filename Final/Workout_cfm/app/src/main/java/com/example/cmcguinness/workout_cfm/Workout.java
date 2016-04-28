package com.example.cmcguinness.workout_cfm;

/**
 * Created by cmcguinness on 4/28/16.
 */
public class Workout {
    private String name;
    private int imageResourceID;

    // initialize constructor
    private Workout(String newname, int newID) {
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final Workout[] cardio = {
            new Workout("Running", R.drawable.cardioimage),
            new Workout("Dancing", R.drawable.cardioimage)
    };

    public static final Workout[] strength = {
            new Workout("Push ups", R.drawable.strengthimage),
            new Workout("Squats", R.drawable.strengthimage)
    };

    public static final Workout[] flexibility = {
            new Workout("Stretching", R.drawable.flexibilityimage),
            new Workout("Yoga", R.drawable.flexibilityimage)
    };

    public String getName() {
        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    public String toString() {
        return this.name;
    }
}

