package it.prova.raccoltafilmspringmvc.repository.film;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;

import it.prova.raccoltafilmspringmvc.model.Film;

public class CustomFilmRepositoryImpl implements CustomFilmRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Film> findByExample(Film example) {
		Map<String, Object> paramaterMap = new HashMap<String, Object>();
		List<String> whereClauses = new ArrayList<String>();

		StringBuilder queryBuilder = new StringBuilder("select r from Film r where r.id = r.id ");

		if (StringUtils.isNotEmpty(example.getTitolo())) {
			whereClauses.add(" r.titolo  like :titolo ");
			paramaterMap.put("titolo", "%" + example.getTitolo() + "%");
		}
		if (StringUtils.isNotEmpty(example.getGenere())) {
			whereClauses.add(" r.genere like :genere ");
			paramaterMap.put("genere", "%" + example.getGenere() + "%");
		}
		if (example.getMinutiDurata() != null) {
			whereClauses.add(" r.minutidurata like :minutidurata ");
			paramaterMap.put("minutidurata", "%" + example.getMinutiDurata() + "%");
		}
		if (example.getRegista().getId() != null) {
			whereClauses.add(" r.regista.id =:regista_id ");
			paramaterMap.put("regista_id", example.getRegista().getId());
		}
		if (example.getDataPubblicazione() != null) {
			whereClauses.add("r.datapubblicazione >= :datapubblicazione ");
			paramaterMap.put("datapubblicazione", example.getDataPubblicazione());
		}

		queryBuilder.append(!whereClauses.isEmpty() ? " and " : "");
		queryBuilder.append(StringUtils.join(whereClauses, " and "));
		TypedQuery<Film> typedQuery = entityManager.createQuery(queryBuilder.toString(), Film.class);

		for (String key : paramaterMap.keySet()) {
			typedQuery.setParameter(key, paramaterMap.get(key));
		}

		return typedQuery.getResultList();
	}

}
