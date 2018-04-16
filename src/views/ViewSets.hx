package views;

import js.npm.Express;

import data.*;

class ViewSets
{
    public function new(express : Express)
    {
        express.get('/sets', getSets);
    }

    private function getSets(req : Dynamic, res : Dynamic)
    {
        var sets = Database.get().col(Set);
        res.render('sets', {title:'Sets', sets: sets});
    }
}