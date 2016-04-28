package com.example.connor.springc;

/**
 * Created by comc3361 on 3/31/16.
 */
public class Bulb {
    private String name;
    private int imageResourceID;

    private Bulb(String newname, int newID) {
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final Bulb[] tulips = {
            new Bulb("Daydream", R.drawable.daydream),
            new Bulb("Apeldoorn Elite", R.drawable.apeldoorn),
            new Bulb("Banja Luka", R.drawable.banjaluka),
            new Bulb("Burning Heart", R.drawable.burningheart),
            new Bulb("Cape Cod", R.drawable.capecod)
    };

    public static final Bulb[] daffodils = {
            new Bulb("Jetfire", R.drawable.jetfire),
            new Bulb("Sentinel", R.drawable.sentinel),
            new Bulb("Thalia", R.drawable.thalia),
            new Bulb("Quail", R.drawable.quail),
            new Bulb("Sorbet", R.drawable.sorbet)
    };

    public static final Bulb[] iris = {
            new Bulb("Azalea", R.drawable.azalea),
            new Bulb("Cosmos", R.drawable.cosmos),
            new Bulb("Dhalias", R.drawable.dhalias),
            new Bulb("Freesia", R.drawable.freesia),
            new Bulb("Gardenias", R.drawable.gardenias)
    };

    public String getName() {
        return name;
    }

    public int getImageResourceID() {
        return imageResourceID;
    }

    public String toString() {
        return this.name;
    }
}
