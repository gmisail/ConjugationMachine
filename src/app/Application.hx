package app;

import js.Node;
import js.node.Http;
import js.node.Path;
import js.npm.Express;
import js.npm.express.*;

import data.*;
import views.*;

class Application
{
    public var host : String = "127.0.0.1";
    public var port : Int = 3000;
    public var express : Express;

    private var viewCreate : ViewCreate;
    private var viewSets : ViewSets;
    private var viewStudy : ViewStudy;

    public function new()
    {
        express = new Express();

        express.use(new Morgan('dev'));
        express.use(BodyParser.json());
        express.use(BodyParser.urlencoded({
            extended: false
        }));
        
        express.set('port', port);
        express.set('views', Node.__dirname + '/public/views');
        express.set('view engine', 'pug');

        express.use(new Static(Path.join(Node.__dirname, 'public')));

        express.get('/', getIndex);

        viewCreate = new ViewCreate(express);
        viewSets = new ViewSets(express);
        viewStudy = new ViewStudy(express);

        express.listen(port, listen);

        Database.addSet(new Set("Jugar", "Present", "Juego", "Juegas", "Juega", "Jugamos", "Jugais", "Juegan"));
    }

    private function listen()
    {
        trace("Running on: " + this.host + ":" + this.port);
    }

    private function getIndex(req : Dynamic, res : Dynamic)
    {
        var sets = Database.get().col(Set);

        res.render('index', {title:'Home', sets: sets});
    }
}