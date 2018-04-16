package views;

import js.npm.Express;
import js.npm.express.*;

import data.*;

class ViewCreate
{
    public function new(express : Express)
    {
        express.get('/create', getCreate);
        express.post('/create', postCreate);
    }

    private function getCreate(req : Dynamic, res : Dynamic)
    {
        var sets = Database.get().col(Set);
        
        res.render('create', {title:'Create', sets: sets});
    }

    private function postCreate(req : Dynamic, res : Dynamic)
    {
        var sets = Database.get().col(Set);

        Database.addSet(new Set(req.body.name, req.body.tense, req.body.fps, req.body.sps, req.body.tps, req.body.fpp, req.body.spp, req.body.tpp));

        res.render('create', {title:"Create", sets: sets, success: true});
    }
}