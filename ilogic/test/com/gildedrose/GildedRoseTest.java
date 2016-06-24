// ***************************************************************************
// Copyright (c) 2016, Industrial Logic, Inc., All Rights Reserved.
//
// This code is the exclusive property of Industrial Logic, Inc. It may ONLY be
// used by students during Industrial Logic's workshops or by individuals
// who are being coached by Industrial Logic on a project.
//
// This code may NOT be copied or used for any other purpose without the prior
// written consent of Industrial Logic, Inc.
// ****************************************************************************

package com.gildedrose;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.Assert.assertEquals;

public class GildedRoseTest {
    final String expected = "OMGHAI!\n"+
            "-------- day 0 --------\n"+
            "name, sellIn, quality\n"+
            "+5 Dexterity Vest, 10, 20\n"+
            "Aged Brie, 2, 0\n"+
            "Elixir of the Mongoose, 5, 7\n"+
            "Sulfuras, Hand of Ragnaros, 0, 80\n"+
            "Sulfuras, Hand of Ragnaros, -1, 80\n"+
            "Backstage passes to a TAFKAL80ETC concert, 15, 20\n"+
            "Backstage passes to a TAFKAL80ETC concert, 10, 49\n"+
            "Backstage passes to a TAFKAL80ETC concert, 5, 49\n"+
            "Conjured Mana Cake, 3, 6\n"+
            "\n"+
            "-------- day 1 --------\n"+
            "name, sellIn, quality\n"+
            "+5 Dexterity Vest, 9, 19\n"+
            "Aged Brie, 1, 1\n"+
            "Elixir of the Mongoose, 4, 6\n"+
            "Sulfuras, Hand of Ragnaros, 0, 80\n"+
            "Sulfuras, Hand of Ragnaros, -1, 80\n"+
            "Backstage passes to a TAFKAL80ETC concert, 14, 21\n"+
            "Backstage passes to a TAFKAL80ETC concert, 9, 50\n"+
            "Backstage passes to a TAFKAL80ETC concert, 4, 50\n"+
            "Conjured Mana Cake, 2, 4\n" +
            "\n";

    @Test
    public void gildedRose() {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        PrintStream out = new PrintStream(output);

        out.println("OMGHAI!");

        Item[] items = new Item[] {
                new Item("+5 Dexterity Vest", 10, 20), //
                new Item("Aged Brie", 2, 0), //
                new Item("Elixir of the Mongoose", 5, 7), //
                new Item("Sulfuras, Hand of Ragnaros", 0, 80), //
                new Item("Sulfuras, Hand of Ragnaros", -1, 80),
                new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20),
                new Item("Backstage passes to a TAFKAL80ETC concert", 10, 49),
                new Item("Backstage passes to a TAFKAL80ETC concert", 5, 49),
                // this conjured item does not work properly yet
                new Item("Conjured Mana Cake", 3, 6) };

        GildedRose app = new GildedRose(items);

        int days = 2;

        for (int i = 0; i < days; i++) {
            out.println("-------- day " + i + " --------");
            out.println("name, sellIn, quality");
            for (Item item : items) {
                out.println(item);
            }
            out.println();
            app.updateQuality();
        }

        System.out.println(output.toString());
        assertEquals(expected, output.toString());
    }
}
