package com.example.cmcguinness.superhero;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.app.FragmentTransaction;
import android.view.View;

public class MainActivity extends AppCompatActivity implements UniverseListFragment.UniverseListListener, HeroDetailFragment.ButtonClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override
    public void itemClicked(long id) {
        HeroDetailFragment frag = new HeroDetailFragment();

        FragmentTransaction ft = getFragmentManager().beginTransaction();

        frag.setUniverse(id);

        ft.replace(R.id.fragment_container, frag);

        ft.addToBackStack(null);

        ft.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);

        ft.commit();

    }

    @Override
    public void addheroclicked(View view) {
        HeroDetailFragment fragment = (HeroDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addhero();
    }

    @Override public void onBackPressed() {
        if (getFragmentManager().getBackStackEntryCount() > 0 ) {
            getFragmentManager().popBackStack();
        } else {
            super.onBackPressed();
        }
    }
}
