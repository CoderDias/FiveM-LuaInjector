    Hashes
    ==========
    engine.dll	14D317B3 (CRC-32)
    client.dll	8DFCE685 (CRC-32)
     
    Offsets
    ==========
    Player Base	client.dll + 9DF064
    Entity Base	client.dll + A7E224
    Entity Size	10
     
    View Matrix	 client.dll + A43764
    Player View	(engine.dll + 509CD4) + 4C88
     
    Entity
    ==========
    Origin		0134	float[3]
    Angle		2374	float
    BoneMatrix	0A78	pointer
    Health		00FC	int32
    Team		00F0	int32
    Spec		171C	int32
    Dormant		00E9	bool
     
    Player
    ==========
    Angle		1584	float
    ViewZ		010C	float
    Target		23C8	int32
     
    BoneMatrix
    ==========
    X		base + 0x30 * iBone + 0x0C
    Y		base + 0x30 * iBone + 0x1C
    Z		base + 0x30 * iBone + 0x2C