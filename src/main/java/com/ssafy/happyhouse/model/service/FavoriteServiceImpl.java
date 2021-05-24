package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dto.Favorite;
import com.ssafy.happyhouse.model.mapper.FavoriteDAO;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	public FavoriteDAO dao;
	
	@Override
	@Transactional
	public void addFavorite(Favorite fav) {
		dao.addFavorite(fav);
	}

	@Override
	@Transactional
	public void removeFavorite(int no) {
		dao.removeFavorite(no);
	}

	@Override
	@Transactional
	public List<Favorite> getFavorite(int userno) {
		return dao.getFavorite(userno);
	}

}
