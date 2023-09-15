class RandomModel {
	int _randomNumber = 0;
  int _quantityNum = 0;

  RandomModel.vazio();
  RandomModel(this._randomNumber, this._quantityNum);

	set randomNumber(int number) => _randomNumber = number;
	set quantityNum(int number) => _quantityNum = number;

	int get randomNumber => _randomNumber;
	int get quantityNum => _quantityNum;
}