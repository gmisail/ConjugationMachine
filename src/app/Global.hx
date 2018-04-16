package app;

import data.Set;

class Global
{
    public static var FORMS : Array<String> = [
        "First Person Singular",
        "Second Person Singular",
        "Third Person Singular",
        "First Person Plural",
        "Second Person Plural",
        "Third Person Plural"
    ];

    public static function getConjugationFromForm(set : Set, form : String) : String
    {
        switch(form)
        {
            case "First Person Singular":
                return set.fps;
            case "Second Person Singular":
                return set.sps;
            case "Third Person Singular":
                return set.tps;
            case "First Person Plural":
                return set.fpp;
            case "Second Person Plural":
                return set.spp;
            case "Third Person Plural":
                return set.tpp;
        }

        return "ERROR";
    }

    public static function getRandom(array : Array<Dynamic>) : Dynamic
    {
        var length = array.length;
        var seed = Math.floor(length * Math.random());

        return array[seed];
    }
}