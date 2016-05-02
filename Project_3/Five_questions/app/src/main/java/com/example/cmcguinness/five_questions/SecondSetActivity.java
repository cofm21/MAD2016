package com.example.cmcguinness.five_questions;

import android.app.Activity;
import android.os.Bundle;
import android.content.Intent;
import android.graphics.Color;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import java.util.ArrayList;

public class SecondSetActivity extends Activity {

    ArrayList<String> choices2 = new ArrayList<String>();
    String[] q_colors = {"Blue", "Red", "Green", "Black"};
    String[] q_vacations = {"Boulder", "Vail", "MOAB", "Las Vegas"};
    String[] q_thehill = {"Illegal Pete's", "Taco Junky", "The Sink", "Half Fast Subs"};

    String[] q_weather = {"Snowy", "Rainy", "Sunny", "Humid"};
    String[] q_food = {"Burgers", "Sushi", "Vegetarian", "Ethnic"};
    String[] q_drink = {"Red Bull", "Tea", "Alcohol", "Soda"};
    Integer count = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second_set);

        Intent intent = getIntent();
        ArrayList<String> first_Choices = new ArrayList<String>();
        first_Choices = intent.getStringArrayListExtra("choiceSet1");
        //System.out.println(first_Choices);
        final String type = intent.getStringExtra("questionSet");

        Bundle b = new Bundle();
        String[] q_set1 = {"Favorite color?", "Best vacation spot?", "Best place to get drinks on the hill?"};
        String[] q_set2 = {"Favorite weather?", "Best type of food?", " Favorite drink?"};

        b.putStringArray("q_set1", q_set1);
        b.putStringArray("q_set2", q_set2);

        final String[] array = b.getStringArray(type);

        final TextView question = (TextView)findViewById(R.id.questionTextView);

        // "...... x" hack to make the label take up the full screen
        question.setText("Hand the device to the other player!           x");

        //http://stackoverflow.com/questions/4817933/what-is-the-equivalent-to-a-javascript-setinterval-settimeout-in-android-java

        if (count == 0) {
            new android.os.Handler().postDelayed(
                    new Runnable() {
                        public void run() {
                            question.setText(array[0]);
                            question.setTextSize(40);
                        }
                    },
                    4000);
        }

        RadioGroup rGroup2 = (RadioGroup) findViewById(R.id.second_radioGroup);

        View.OnClickListener radio_listener = new View.OnClickListener() {
            public void onClick(View v) {
                onRadioButtonClick(v);

            }
        };

        RadioButton button1 = new RadioButton(this);
        if (type.equals("q_set1")) {
            refreshButtonText(button1, 0, q_colors);
        } else {
            refreshButtonText(button1, 0, q_weather);
        }
        button1.setTextColor(Color.BLACK);
        button1.setOnClickListener(radio_listener);
        button1.setTextSize(30);
        button1.setPadding(10,40,0,40);
        rGroup2.addView(button1);
        if (count == 1) {
            if (type.equals("q_set1")) {
                refreshButtonText(button1, 0, q_vacations);
            } else {
                refreshButtonText(button1, 0, q_food);
            }
            question.setText(array[1]);
            question.setTextSize(40);
        }
        if (count == 2) {
            if (type.equals("q_set1")) {
                refreshButtonText(button1, 0, q_thehill);
            } else {
                refreshButtonText(button1, 0, q_drink);
            }
            question.setText(array[2]);
            question.setTextSize(40);
        }
        if (count == 3) {
            Intent i = new Intent(SecondSetActivity.this, ResultActivity.class);
            i.putExtra("choiceSet2", choices2);
            i.putExtra("questionSet", type);
            i.putExtra("choiceSet1", first_Choices);
            startActivity(i);
        }

        RadioButton button2 = new RadioButton(this);
        refreshButtonText(button2, 1, q_colors);
        button2.setTextColor(Color.BLACK);
        button2.setOnClickListener(radio_listener);
        button2.setTextSize(30);
        button2.setPadding(10,40,0,40);
        rGroup2.addView(button2);
        if (count == 1) {
            if (type.equals("q_set1")) {
                refreshButtonText(button2, 1, q_vacations);
            } else {
                refreshButtonText(button2, 1, q_food);
            }
            question.setText(array[1]);
            question.setTextSize(40);
        }
        if (count == 2) {
            if (type.equals("q_set1")) {
                refreshButtonText(button2, 1, q_thehill);
            } else {
                refreshButtonText(button2, 1, q_drink);
            }
            question.setText(array[2]);
            question.setTextSize(40);
        }
        if (count == 3) {
            Intent i = new Intent(SecondSetActivity.this, ResultActivity.class);
            i.putExtra("choiceSet2", choices2);
            i.putExtra("questionSet", type);
            i.putExtra("choiceSet1", first_Choices);
            startActivity(i);
        }

        RadioButton button3 = new RadioButton(this);
        if (type.equals("q_set1")) {
            refreshButtonText(button3, 2, q_colors);
        } else {
            refreshButtonText(button3, 2, q_weather);
        }
        button3.setTextColor(Color.BLACK);
        button3.setOnClickListener(radio_listener);
        button3.setTextSize(30);
        button3.setPadding(10,40,0,40);
        rGroup2.addView(button3);
        if (count == 1) {
            if (type.equals("q_set1")) {
                refreshButtonText(button3, 2, q_vacations);
            } else {
                refreshButtonText(button3, 2, q_food);
            }
            question.setText(array[1]);
            question.setTextSize(40);
        }
        if (count == 2) {
            if (type.equals("q_set1")) {
                refreshButtonText(button3, 2, q_thehill);
            } else {
                refreshButtonText(button3, 2, q_drink);
            }
            question.setText(array[2]);
            question.setTextSize(40);
        }
        if (count == 3) {
            Intent i = new Intent(SecondSetActivity.this, ResultActivity.class);
            i.putExtra("choiceSet2", choices2);
            i.putExtra("questionSet", type);
            i.putExtra("choiceSet1", first_Choices);
            startActivity(i);
        }

        RadioButton button4 = new RadioButton(this);
        if (type.equals("q_set1")) {
            refreshButtonText(button4, 3, q_colors);
        } else {
            refreshButtonText(button4, 3, q_weather);
        }
        button4.setTextColor(Color.BLACK);
        button4.setOnClickListener(radio_listener);
        button4.setTextSize(30);
        button4.setPadding(10,40,0,40);
        rGroup2.addView(button4);
        if (count == 1) {
            if (type.equals("q_set1")) {
                refreshButtonText(button4, 3, q_vacations);
            } else {
                refreshButtonText(button4, 3, q_food);
            }
            question.setText(array[1]);
            question.setTextSize(40);
        }
        if (count == 2) {
            if (type.equals("q_set1")) {
                refreshButtonText(button4, 3, q_thehill);
            } else {
                refreshButtonText(button4, 3, q_drink);
            }
            question.setText(array[2]);
            question.setTextSize(40);
        }
        if (count == 3) {
            Intent i = new Intent(SecondSetActivity.this, ResultActivity.class);
            i.putExtra("choiceSet2", choices2);
            i.putExtra("questionSet", type);
            i.putExtra("choiceSet1", first_Choices);
            startActivity(i);
        }


    }

    public void refreshButtonText(RadioButton button, int i, String[] array) {
        button.setText(array[i]);
        TextView question = (TextView)findViewById(R.id.questionTextView);

    }


    public void onRadioButtonClick(View v) {
        RadioButton button = (RadioButton) v;
        String choice1 = button.getText().toString();
        if (choices2.contains(choice1) == false) {
            choices2.add(choice1);
        } else {



        }
        count = count + 1;
        onCreate(new Bundle());
        System.out.println(choices2);

        //don't add twice TD
    }

}
