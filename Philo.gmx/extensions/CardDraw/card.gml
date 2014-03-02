#define init_game
	_players = argument[0];
	switch(_players)
		{
		case 2: global.basic=6;global.philo=2;break;
		case 3: global.basic=7;global.philo=3;break;
		case 4: global.basic=8;global.philo=4;break;
		}
	_element_deck = instance_create(0,0, obj_element_deck);
	
	return true;

#define draw_card
	_deck = argument[0]
	
	if(_deck.card_count > 0 )
	{
		if(_deck.philosopher > 0){
			if(irandom_range(1,_deck.card_count)<=_deck.card_count){
				_deck.philosopher-=1;
				card_count -= 1;
				_deck.drawn_card = "PHILO";
				return true;
			}
		}
		card = irandom_range(1,_deck.card_count);
		if(card >=1 && card <=1+_deck.cards[0]){
			_deck.cards[0] -= 1;
			_deck.drawn_card = "ARSENIC";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0] && card <= 1+_deck.cards[0]+_deck.cards[1]){
			_deck.cards[1] -= 1;
			_deck.drawn_card = "MAGNESIUM";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]){
			_deck.cards[2] -= 1;
			_deck.drawn_card = "SULFUR";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]){
			_deck.cards[3] -= 1;
			_deck.drawn_card = "ZINC";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]){
			_deck.cards[4] -= 1;
			_deck.drawn_card = "AIR";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]){
			_deck.cards[5] -= 1;
			_deck.drawn_card = "EARTH";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]+_deck.cards[6]){
			_deck.cards[6] -= 1;
			_deck.drawn_card = "FIRE";
			_deck.card_count -= 1;
			return true;
		}else if(card >= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]+_deck.cards[6] && card <= 1+_deck.cards[0]+_deck.cards[1]+_deck.cards[2]+_deck.cards[3]+_deck.cards[4]+_deck.cards[5]+_deck.cards[6]+_deck.cards[7]){
			_deck.cards[7] -= 1;
			_deck.drawn_card = "WATER";
			_deck.card_count -= 1;
			return true;
		}
		
		else{
			_deck.card_count -= 1;
			_deck.drawn_card = "OTHER";
			return true;
		}
	}