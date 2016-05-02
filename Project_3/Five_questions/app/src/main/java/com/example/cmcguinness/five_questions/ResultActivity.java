package com.example.cmcguinness.five_questions;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.ArrayList;

public class ResultActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        Intent intent = getIntent();

        ArrayList<String> first_Choices = new ArrayList<String>();
        ArrayList<String> second_Choices = new ArrayList<String>();
        first_Choices = intent.getStringArrayListExtra("choiceSet1");
        second_Choices = intent.getStringArrayListExtra("choiceSet2");

        TextView player1 = (TextView)findViewById(R.id.player1TextView);
        TextView player2 = (TextView)findViewById(R.id.player2TextView);
        TextView resultPercent = (TextView)findViewById(R.id.resultPercent);

        player1.setText(first_Choices.toString());
        player2.setText(second_Choices.toString());
        Integer match = 0;
        for (int i = 0; i < 3; i++) {
            String curr = first_Choices.get(i);
            if (second_Choices.contains(curr)) {
                match = match + 1;
            } else {
                match = match;
            }
        }

        float newMatch = (float) match / 3;

        newMatch = newMatch * 100;

        String results = String.valueOf(newMatch);


        resultPercent.setText(results + " %");


        Button home = (Button)findViewById(R.id.homeButton);

        home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ResultActivity.this, MainActivity.class);
                startActivity(i);
            }
        });

    }
}
