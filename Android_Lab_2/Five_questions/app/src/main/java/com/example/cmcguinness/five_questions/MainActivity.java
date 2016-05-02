package com.example.cmcguinness.five_questions;

import android.content.Intent;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;


public class MainActivity extends Activity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button play = (Button)findViewById(R.id.playButton);

        //String[] array = b.getStringArray("identifier");
        //System.out.println(array[0]);

        //http://stackoverflow.com/questions/6029495/how-can-i-generate-random-number-in-specific-range-in-android
        Random r = new Random();
        int i1 = r.nextInt(3 - 1) + 1;

        final String q_identifier = "q_set" + i1;

        System.out.println(q_identifier);

        play.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(MainActivity.this, FirstSetActivity.class);
                i.putExtra("questionSet", q_identifier);
                startActivity(i);
            }
        });
    }
}
