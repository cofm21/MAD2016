package com.example.connor.springc;

import android.app.ActionBar;
import android.os.Bundle;
import android.app.Activity;
import android.text.InputType;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class OrderActivity extends Activity {

    EditText mEdit;
    String name;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order);

        Button btn;

        ActionBar actionBar = getActionBar();

        actionBar.setDisplayHomeAsUpEnabled(true);

        mEdit = (EditText)findViewById(R.id.editName);

        name = mEdit.getText().toString();



        btn =(Button)findViewById(R.id.submitButton);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View vw) {
                TextView message = (TextView)findViewById(R.id.submitMessage);
                message.setText("Thank you for your order.");

            }
        });

    }

}
