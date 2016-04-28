package com.example.connor.springc;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

public class BulbActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bulb);

        int bulbnum = (Integer)getIntent().getExtras().get("bulbid");
        String type = (String)getIntent().getExtras().get("bulbtype");


        Bulb bulb = Bulb.tulips[bulbnum];
        Bulb bulb2 = Bulb.daffodils[bulbnum];
        Bulb bulb3 = Bulb.iris[bulbnum];

        if (type.equals("Tulips")) {
            ImageView bulbImage = (ImageView) findViewById(R.id.bulbImageView);
            bulbImage.setImageResource(bulb.getImageResourceID());

            TextView bulbName = (TextView) findViewById(R.id.bulb_name);
            bulbName.setText(bulb.getName());
        } else if (type.equals("Daffodils")) {
            ImageView bulbImage = (ImageView) findViewById(R.id.bulbImageView);
            bulbImage.setImageResource(bulb2.getImageResourceID());

            TextView bulbName = (TextView) findViewById(R.id.bulb_name);
            bulbName.setText(bulb2.getName());
        } else if (type.equals("Iris")) {
            ImageView bulbImage = (ImageView) findViewById(R.id.bulbImageView);
            bulbImage.setImageResource(bulb3.getImageResourceID());

            TextView bulbName = (TextView) findViewById(R.id.bulb_name);
            bulbName.setText(bulb3.getName());
        }

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        //inflate the menu to add items to the action bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.create_order:
                Intent intent = new Intent(this, OrderActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

}
