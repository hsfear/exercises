package com.gildedrose;

class GildedRose {
    Item[] items;
    public GildedRose(Item[] items) {
        this.items = items;
    }

    public void updateQuality() {
        for (Item item : items) {
            if (isLegendary(item)) continue;

            item.sellIn = item.sellIn - 1;

            int increment = item.name.equals("Aged Brie")                                 ? normalIncrement(item) :
                            item.name.equals("Backstage passes to a TAFKAL80ETC concert") ? TAFKAL80ETCIncrement(item) :
                            item.name.startsWith("Conjured")                              ? 2 * -normalIncrement(item) :
                                                                                            -normalIncrement(item);

            item.quality = Math.min(50, Math.max(0, item.quality + increment));        }
    }

    private boolean isLegendary(Item item) { return item.name.equals("Sulfuras, Hand of Ragnaros"); }

    private int normalIncrement(Item item) { return item.sellIn < 0 ? 2 : 1; }

    private int TAFKAL80ETCIncrement(Item item) {
        return item.sellIn < 0  ? -item.quality :
               item.sellIn < 5  ? 3 :
               item.sellIn < 10 ? 2 :
                                  1;
    }
}
