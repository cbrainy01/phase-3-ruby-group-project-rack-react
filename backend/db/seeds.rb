Player.destroy_all
FantasyTeam.destroy_all
League.destroy_all

# prem = League.create(name: "Premier League", country: "England")

goonies = FantasyTeam.create(name: "Goonies", owner: "Mikey")

lions = FantasyTeam.create(name: "Lions", owner: "Cameron")

clovers = FantasyTeam.create(name: "Clovers", owner: "Kenny")

dele = Player.create(name: "Dele Alli", position: "CAM", goals: 5, assists: 12, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p108823.png")

kante = Player.create(name: "Ngolo Kante", position: "CDM", goals: 2, assists: 6, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p116594.png" )

allison = Player.create(name: "Allison Becker", position: "GK", goals: 1, assists: 0, status: "Free Agent", saves: 16, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p116535.png" )

adama = Player.create(name: "Adama Traore", position: "RW", goals: 3, assists: 15, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p159533.png" )
adama = Player.where(name: "Adama Traore")[0]


shaw = Player.create(name: "Luke Shaw", position: "LB", goals: 2, assists: 8, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p106760.png" )
shaw = Player.where(name: "Luke Shaw")[0]

kane = Player.create(name: "Harry Kane", position: "ST", goals: 22, assists: 20, status: "Free Agent", saves: 0, image: "https://tot-tmp.azureedge.net/media/31722/firstteam_harrykane.png" )
kane = Player.where(name: "Harry Kane")[0]

greenwood = Player.create(name: "Mason Greenwood", position: "RW", goals: 12, assists: 2, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p220688.png" )
vardy = Player.create(name: "Jamie Vardy", position: "St", goals: 19, assists: 5, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p101668.png" )
lucas = Player.create(name: "Lucas Moura", position: "RM", goals: 10, assists: 4, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p95715.png" )
robertson = Player.create(name: "Andy Robertson", position: "LB", goals: 0, assists: 6, status: "Free Agent", saves: 0, image: "https://resources.premierleague.com/premierleague/photos/players/250x250/p122798.png" )


# penners = FantasyTeam.all[1]
 rangers = FantasyTeam.all[0]
 tornado = FantasyTeam.all[2]
