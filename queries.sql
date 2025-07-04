1. Get all available blood bags:

SELECT 
    bb.BloodBagID,
    bt.Type,
    bt.RhFactor,
    bb.DonationDate,
    bb.ExpiryDate,
    bb.Quantity
FROM 
    BloodBags bb
JOIN 
    BloodTypes bt ON bb.BloodTypeID = bt.BloodTypeID
WHERE 
    bb.Status = 'Available';

2.Get all blood requests for a specific recipient:

SELECT 
    br.RequestID,
    r.FirstName,
    r.LastName,
    bt.Type,
    bt.RhFactor,
    br.Quantity,
    br.Status
FROM 
    BloodRequests br
JOIN 
    Recipients r ON br.RecipientID = r.RecipientID
JOIN 
    BloodTypes bt ON br.BloodTypeID = bt.BloodTypeID
WHERE 
    r.RecipientID = 1; -- Change to the desired recipient ID

3. Get transfusion history for a specific recipient:

SELECT 
    t.TransfusionID,
    r.FirstName,
    r.LastName,
    bb.BloodBagID,
    t.TransfusionDate,
    t.Quantity
FROM 
    Transfusions t
JOIN 
    Recipients r ON t.RecipientID = r.RecipientID
JOIN 
    BloodBags bb ON t.BloodBagID = bb.BloodBagID
WHERE 
    r.RecipientID = 1; -- Change to the desired recipient ID

4. Get total blood donations by blood type:

SELECT 
    bt.Type,
    bt.RhFactor,
    SUM(bb.Quantity) AS TotalDonated
FROM 
    BloodBags bb
JOIN 
    BloodTypes bt ON bb.BloodTypeID = bt.BloodTypeID
WHERE 
    bb.Status = 'Available'
GROUP BY 
    bt.Type, bt.RhFactor;

5. Get all donors who have donated a specific blood type:

SELECT 
    d.FirstName,
    d.LastName,
    d.Phone,
    d.Email
FROM 
    Donors d
JOIN 
    BloodTypes bt ON d.BloodTypeID = bt.BloodTypeID
WHERE 
    bt.Type = 'A' AND bt.RhFactor = '+'; -- Change to desired blood type
