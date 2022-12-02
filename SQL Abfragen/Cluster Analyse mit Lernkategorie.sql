
USE Patentsview

SELECT p.patent_id, p.type, cpc.group_id, 'Supervised Learning' AS Lernkategorie
FROM Patentsview.patent p
	JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
		JOIN Patentsview.assignee ass
		ON pa.assignee_id = ass.assignee_id
			JOIN Patentsview.cpc_current cpc
			ON cpc.patent_id = p.patent_id
WHERE 
		CONTAINS(ABSTRACT, 'NEAR(("supervised*", "learning*" ), 1)')

	UNION

SELECT p.patent_id, p.type, cpc.group_id, 'Unsupervised Learning' AS Lernkategorie
FROM Patentsview.patent p
	JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
		JOIN Patentsview.assignee ass
		ON pa.assignee_id = ass.assignee_id
			JOIN Patentsview.cpc_current cpc
			ON cpc.patent_id = p.patent_id
WHERE 
		CONTAINS(ABSTRACT, 'NEAR(("Unsupervised*", "learning*" ), 1)')

	UNION

SELECT p.patent_id, p.type, cpc.group_id, 'Semi-Supervised Learning' AS Lernkategorie
FROM Patentsview.patent p
	JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
		JOIN Patentsview.assignee ass
		ON pa.assignee_id = ass.assignee_id
			JOIN Patentsview.cpc_current cpc
			ON cpc.patent_id = p.patent_id
WHERE 
		CONTAINS(ABSTRACT, 'NEAR(("semi*", "supervised*" ), 1)')

	UNION

SELECT p.patent_id, p.type, cpc.group_id, 'Reinforcement Learning' AS Lernkategorie
FROM Patentsview.patent p
	JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
		JOIN Patentsview.assignee ass
		ON pa.assignee_id = ass.assignee_id
			JOIN Patentsview.cpc_current cpc
			ON cpc.patent_id = p.patent_id
WHERE 
		CONTAINS(ABSTRACT, 'NEAR(("Reinforcement*", "Learning*" ), 1)')

	UNION

SELECT p.patent_id, p.type, cpc.group_id, 'Active Learning' AS Lernkategorie
FROM Patentsview.patent p
	JOIN Patentsview.patent_assignee pa
	ON p.patent_id = pa.patent_id
		JOIN Patentsview.assignee ass
		ON pa.assignee_id = ass.assignee_id
			JOIN Patentsview.cpc_current cpc
			ON cpc.patent_id = p.patent_id
WHERE 
		CONTAINS(ABSTRACT, 'NEAR(("Active*", "Learning*" ), 1)')