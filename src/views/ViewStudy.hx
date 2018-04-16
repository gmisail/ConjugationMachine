package views;

import js.npm.Express;

import app.Global;
import data.*;

class ViewStudy
{
    public var set : Set;
    public var form : String;

    public function new(express : Express)
    {
        express.get('/study', getStudy);
        express.post('/study', postStudy);
    }

    private function generate(sets : Array<Set>) : Void
    {
        set = Global.getRandom(sets);
        form = Global.getRandom(Global.FORMS);
    }

    private function getStudy(req : Dynamic, res : Dynamic)
    {
        var sets = Database.get().col(Set);
        generate(sets);

        res.render('study', {title:'Study', verb:set.name, tense:set.tense, form: form, sets: sets, answer: false, correct: false, realAnswer: "void", givenAnswer: "void"});
    }

    private function postStudy(req : Dynamic, res : Dynamic)
    {
        var givenAnswer = req.body.conjugation;
        var realAnswer = Global.getConjugationFromForm(set, form);
        var correct : Bool;
        correct = (givenAnswer.toLowerCase() == realAnswer.toLowerCase());

        var sets = Database.get().col(Set);
        generate(sets);

        res.render('study', {title:'Study', verb:set.name, tense:set.tense, form: form, answer: true, correct: correct, realAnswer: realAnswer, givenAnswer: givenAnswer});
    }
}