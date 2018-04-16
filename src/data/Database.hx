package data;

class Database
{
    private static var database : HaxeLow;

    public static function get()
    {
        if(database == null)
        {
            database = new HaxeLow('db.json');
        }

        /* depending on the target, the db will change */

        return database;
    }

    public static function addSet(set : Set)
    {
        var sets = get().col(Set);
		sets.push(set);

		get().save();
    }
}