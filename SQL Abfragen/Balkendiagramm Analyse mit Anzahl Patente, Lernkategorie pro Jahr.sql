
USE Patentsview

SELECT COUNT(*) AS AnzahlPatente, p.year AS Jahr, 'Patente insgesamt' AS Lernkategorie
FROM Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
		LEFT JOIN Patentsview.assignee a
		ON pa.assignee_id = a.assignee_id
WHERE 
		CONTAINS(ABSTRACT, 'NEAR(("machine*", "learning*" ), 1)
							OR NEAR (("supervised*", "learning*"), 1)
							OR NEAR (("unsupervised*", "learning*" ), 1)
							OR NEAR (("partially *", "supervised *" ), 1)
							OR NEAR (("encouraging*", "learning*" ), 1)
							OR NEAR (("active*", "learning*" ), 1) 
							OR "% machine learning %"')
							AND a.organization IS NOT NULL
GROUP BY p.year

UNION

SELECT COUNT(DISTINCT (ass.organization)), p.year AS Jahr, 'Anzahl Organisation' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND
		CONTAINS(ABSTRACT, 'NEAR(("machine*", "learning*" ), 1)
							OR NEAR (("supervised*", "learning*"), 1)
							OR NEAR (("unsupervised*", "learning*" ), 1)
							OR NEAR (("partially *", "supervised *" ), 1)
							OR NEAR (("encouraging*", "learning*" ), 1)
							OR NEAR (("active*", "learning*" ), 1) 
							OR "% machine learning %"')
GROUP BY p.year

UNION

SELECT COUNT(DISTINCT (ass.organization)), p.year AS Jahr, 'Supervised Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("supervised*", "learning*" ), 1)')
GROUP BY p.year

UNION

SELECT COUNT(DISTINCT (ass.organization)), p.year AS Jahr, 'Unsupervised Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("unsupervised*", "learning*" ), 1)')
GROUP BY p.year

	UNION

SELECT COUNT(DISTINCT (ass.organization)), p.year AS Jahr, 'Semi-Supervised Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("semi*", "supervised*" ), 1)')
GROUP BY p.year

	UNION

SELECT COUNT(DISTINCT (ass.organization)), p.year AS Jahr, 'Reinforcement Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("Reinforcement*", "learning*" ), 1)')
GROUP BY p.year

	UNION

SELECT COUNT(DISTINCT (ass.organization)), p.year AS Jahr, 'Active Learning' AS Lernkategorie
	FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("active*", "learning*" ), 1)')

GROUP BY p.year

ORDER BY p.year ASC, AnzahlPatente DESC, Lernkategorie