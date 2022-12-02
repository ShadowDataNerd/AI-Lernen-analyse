
USE Patentsview

SELECT COUNT(ass.organization) AS AnzahlPatente, 'Supervised Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("supervised*", "learning*" ), 1)')

	UNION

SELECT COUNT(ass.organization), 'Unsupervised Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("unsupervised*", "learning*" ), 1)')

	UNION

SELECT COUNT(ass.organization), 'Semi-Supervised Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("semi*", "supervised*" ), 1)')

	UNION

SELECT COUNT(ass.organization), 'Reinforcement Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("Reinforcement*", "learning*" ), 1)')

	UNION

SELECT COUNT(ass.organization), 'Active Learning' AS Lernkategorie
FROM Patentsview.assignee ass, Patentsview.patent p
	LEFT JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
WHERE ass.organization IS NOT NULL AND pa.assignee_id = ass.assignee_id AND 
		CONTAINS(ABSTRACT, 'NEAR(("active*", "learning*" ), 1)')

ORDER BY Lernkategorie