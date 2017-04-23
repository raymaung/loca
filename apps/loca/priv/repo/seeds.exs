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
  },

  {
    "English",
    "Good Bye",
    [
      {"Chinese", "再见"},
      {"French", "Au Revoir"},
      {"Armenia", "Ցտեսություն"},
      {"Bosnian", "good Bye"}
    ]
  },

  {
    "English",
    "Frankly, my dear, I don't give a damn.",
    [
      {"Chinese", "坦白说，亲爱的，我不会死的。"},
      {"French", "Franchement, ma chère, je m'en fous."},
      {"Armenia", "Անկեղծ ասած, իմ սիրելի, ես չեմ թքել."},
      {"Bosnian", "Iskreno, draga moja, ja ne briga."}
    ]
  },

  {
    "English",
    "I'm gonna make him an offer he can't refuse.",
    [
      {"Chinese", "我会让他成为他不能拒绝的报价。"},
      {"French", "Je vais lui faire une offre qu'il ne peut pas refuser."},
      {"Armenia", "Ես gonna դարձնել նրան, որ առաջարկ չի կարող հրաժարվել:"},
      {"Bosnian", "Ja ću mu dati ponudu ne može odbiti."}
    ]
  },

  {
    "English",
    "Toto, I've a feeling we're not in Kansas anymore.",
    [
      {"Chinese", "托多，我有一种感觉，我们现在不在堪萨斯州了。"},
      {"French", "Toto, j'ai l'impression que nous ne sommes plus au Kansas."},
      {"Armenia", "Toto, ես մի զգացողություն մենք չենք Կանզասի այլեւս."},
      {"Bosnian", "Toto, imam osjećaj da nismo više u Kanzasu."}
    ]

  },

  {
    "English",
    "You’re gonna need a bigger boat.",
    [
      {"Chinese", "你会需要一条更大的船。"},
      {"French", "Vous aurez besoin d'un bateau plus gros."},
      {"Armenia", "Դուք gonna պետք է ավելի մեծ նավակ."},
      {"Bosnian", "Ti ćeš trebati veći brod."}
    ]
  },

  {
    "English",
    "Houston, we have a problem.",
    [
      {"Chinese", "休斯顿，我们有一个问题。"},
      {"French", "Houston nous avons un problème."},
      {"Armenia", "Houston, մենք խնդիր ունենք:"},
      {"Bosnian", "Houston, imamo problem."}
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