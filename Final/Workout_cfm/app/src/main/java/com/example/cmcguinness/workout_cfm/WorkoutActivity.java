package com.example.cmcguinness.workout_cfm;

import android.content.res.Resources;
import android.support.v4.content.ContextCompat;
import android.app.Activity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;
import android.content.Intent;

public class WorkoutActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_workout);

        Intent intent = getIntent();


        int workoutNum = (Integer)getIntent().getExtras().get("workoutid");
        String type = intent.getStringExtra("workoutType");

        Workout workout;

        switch (type) {
            case "Cardio":
                workout = Workout.cardio[workoutNum];
                break;
            case "Strength":
                workout = Workout.strength[workoutNum];
                break;
            case "Flexibility":
                workout = Workout.flexibility[workoutNum];
                break;
            default:
                workout = Workout.cardio[workoutNum];
                break;
        }



        ImageView workoutImage = (ImageView)findViewById(R.id.workoutImageView);
        workoutImage.setImageResource(workout.getImageResourceID());

        TextView workoutName = (TextView)findViewById(R.id.workoutType_name);
        workoutName.setText(workout.getName());

    }
}
