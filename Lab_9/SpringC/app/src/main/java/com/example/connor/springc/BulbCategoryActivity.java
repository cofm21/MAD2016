package com.example.connor.springc;

import android.app.ListActivity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class BulbCategoryActivity extends ListActivity {

    private String bulbtype;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        Intent i = getIntent();
        bulbtype = i.getStringExtra("bulbtype");

        ListView listBulbs = getListView();

        ArrayAdapter<Bulb> listAdapter;

        switch(bulbtype) {
            case "Tulips":
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_expandable_list_item_1, Bulb.tulips);
                break;
            case "Daffodils":
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_expandable_list_item_1, Bulb.daffodils);
                break;
            case "Iris":
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_expandable_list_item_1, Bulb.iris);
                break;
            default: listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_expandable_list_item_1, Bulb.tulips);
        }

        listBulbs.setAdapter(listAdapter);
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


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        Intent intent = new Intent(BulbCategoryActivity.this, BulbActivity.class);
        intent.putExtra("bulbid",(int) id);
        intent.putExtra("bulbtype", bulbtype);
        startActivity(intent);
    }
}
