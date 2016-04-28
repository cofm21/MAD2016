package com.example.cmcguinness.workout_cfm;

import android.app.ListActivity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class WorkoutCategoryActivity extends ListActivity {

    private String workoutType;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        Intent i = getIntent();
        workoutType = i.getStringExtra("workoutType");
        ListView listWorkouts = getListView();
        ArrayAdapter<Workout> listAdapter;
        switch (workoutType){
            case "Cardio":
                listAdapter = new ArrayAdapter<Workout>(this, android.R.layout.simple_list_item_1, Workout.cardio);
                break;
            case "Strength":
                listAdapter = new ArrayAdapter<Workout>(this, android.R.layout.simple_list_item_1, Workout.strength);
                break;
            case "Flexibility":
                listAdapter = new ArrayAdapter<Workout>(this, android.R.layout.simple_list_item_1, Workout.flexibility);
                break;
            default: listAdapter = new ArrayAdapter<Workout>(this, android.R.layout.simple_list_item_1, Workout.cardio);
        }

        listWorkouts.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        Intent intent = new Intent(WorkoutCategoryActivity.this, WorkoutActivity.class);
        intent.putExtra("workoutid", (int) id);
        intent.putExtra("workoutType", workoutType);
        startActivity(intent);
    }
}
