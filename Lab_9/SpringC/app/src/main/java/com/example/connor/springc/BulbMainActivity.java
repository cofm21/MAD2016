package com.example.connor.springc;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class BulbMainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bulb_main);

        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> listView, View view, int position, long id) {
                String bulbtype = (String) listView.getItemAtPosition(position);

                Intent intent = new Intent(BulbMainActivity.this, BulbCategoryActivity.class);

                intent.putExtra("bulbtype", bulbtype);

                startActivity(intent);
            }
        };

        ListView listview = (ListView) findViewById(R.id.listView);

        listview.setOnItemClickListener(itemClickListener);


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
