package;

import app.Application;

class Server
{
    public var application : Application;

    public static function main()
    {
        new Server();
    }

    public function new()
    {
        application = new Application();
    }
}