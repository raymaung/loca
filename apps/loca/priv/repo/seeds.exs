# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Loca.Repo.insert!(%Loca.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Loca.TranslationService.Phase
alias Loca.TranslationService.Translation

# phase1 = Loca.Repo.insert! %Phase{language: "English", text: "Hello"}

phase_translations = [
  {
    "English",
    "Hello",
    [
      {"Chinese", "你好"},
      {"French", "Bonjour"},
      {"Armenia", "Բարեւ"},
      {"Bosnian", "zdravo"}
    ]
  }
]

for {src_language, text, translations} <- phase_translations do
  p = Loca.Repo.insert! %Phase{language: src_language, text: text}

  for {target_language, translated_text} <- translations do
    t = Loca.Repo.insert! %Translation {
      phase_id: p.id,
      language: target_language,
      text: translated_text
    }
  end
end