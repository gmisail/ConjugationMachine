package data;

class Set
{
    public var name : String;
    public var tense : String;
    public var fps : String;
    public var sps : String;
    public var tps : String;
    public var fpp : String;
    public var spp : String;
    public var tpp : String;

    public function new(name : String, tense : String, fps : String, sps : String, tps : String, fpp : String, spp : String, tpp : String)
    {
        this.name = name;
        this.tense = tense;
        this.fps = fps;
        this.sps = sps;
        this.tps = tps;
        this.fpp = fpp;
        this.spp = spp;
        this.tpp = tpp;
    }
}