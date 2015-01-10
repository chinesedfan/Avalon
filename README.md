Avalon
======

The motivation of this iOS app is to be able to play Avalon when you don't have entity cards. The best interface orientation should be the landscape iPhone, but I want to practice autolayout technologies. And I just have an iPad instead of an iPhone, so that I will try to support both landscape and portrait mode, as well as iPhone and iPad.

This board game, Avalon, is supported for 5-10 players. At the preparation phase, each player will obtain its own role randomly and be assigned to a specified group, the Arthur's (the justice side) or the Mordred's (the evil side). You can use the system default lineup or customize by yourself.

Every role has its special abilities and purposes. The justice side is:

* Merlin: the leader of the Arthur's, who knows players of the evil side except Mordred. This role should guide the justice side to recognize the evil side and hide himself from being exposed at the same time.
* Percival: the protector of Merlin, who knows Merlin and Morgana but don't know who is the exact one. This role should recognize the real Merlin as soon as possible and help Merlin to guide the justice side, so that Merlin will not be found by the evil side.
* Loyalist: common players of the justice side without any special abilities. Listen other player's speech and distinguish. Select only the justice side to do the task and protect Merlin as well.

The evil side has:

* Morgana: the fake Merlin from the evil side, whose main purpose is to confuse Percival and Loyalists.
* Assassinator: the killer of the evil side. Even if the evil side fails in the task phase, there is still an opportunity to reverse. That is to identify Merlin and kill him. This can happen at any time during the game, but to be safe, Assassinator usually does at the last time.
* Mordred: the only evil one that Merlin does't know. Finding this role out is a very important thing for the justice side.
* Oberon: the lonely evil one that other evil players don't know, and this role also doesn't know its teammates. So he may disturb the evil side's plan inadvertently.
* Pawn: common players of the evil side without any special abilities. Just like Loyalists, Pawns help its side to win in the task phase.

When the game is started, it enters the task phase and has 5 rounds. Each round can be divided into the assign phase, the vote phase and the execute phase. During the assign phase, the current assigner will choose some players to do the task. Everyone can give a speech to express its opinion about this assignment. Then all players vote for the assignment in the vote phase. If more than half players agree, the task comes the execute phase. If not, the next assigner will give another assignment, everybody discusses and votes again. A task can be assigned for 4 times at most. Or this task is recorded as the evil side wins.

During the execute phase, each task participator determines to let the task success or fail. The determinations are recorded without names, so all players don't know who gives a positive vote or a negative vote. As long as there has 1 negative vote, this task is failed(The 4th task is a little special that needs 2 negative votes to be failed). If 3 tasks have been failed, the evil side wins. If 3 tasks have been succeeded and Assassinator doesn't kill Merlin, the justice side wins.