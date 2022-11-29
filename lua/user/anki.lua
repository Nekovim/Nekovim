local status_ok, anki = pcall(require, "anki")
if not status_ok then
	return
end

anki.setup({
    tex_support = false;
    models = {
        ["Question"] = "Programming::Languages::C#",
        -- ["Java"] = "Programming::Languages::Java",
        -- ["DesignPattern"] = "Programming::Software Design::Design Patterns",
        -- ["FunctionalProgramming"] = "Programming::Software Design::FunctionalProgramming",
        -- ["OOP"] = "Programming::Software Design::Object Oriented Programming",
        -- ["Graphics"] = "Programming::Graphics",
    }
})
