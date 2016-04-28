package com.example.cmcguinness.workout_cfm;

import android.content.Intent;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //create a listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {

            public void onItemClick(AdapterView<?> listView, View view, int position, long id) {

                String workoutType = (String) listView.getItemAtPosition(position);

                Intent intent = new Intent(MainActivity.this, WorkoutCategoryActivity.class);

                intent.putExtra("workoutType", workoutType);

                startActivity(intent);
            }
        };

        ListView listview = (ListView) findViewById(R.id.listView);

        listview.setOnItemClickListener(itemClickListener);
    }

}
