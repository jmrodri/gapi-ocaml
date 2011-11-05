open GdataUtils.Op

module Make(Link : GdataCore.DATA) =
struct
  (* Comment data types *)
  module Entry =
  struct
    type t = {
      ce_etag : string;
      ce_authors : GdataAtom.atom_author list;
      ce_content : GdataAtom.atom_content;
      ce_contributors : GdataAtom.atom_contributor list;
      ce_id : GdataAtom.atom_id;
      ce_published : GdataAtom.atom_published;
      ce_updated : GdataAtom.atom_updated;
      ce_links : Link.t list;
      ce_title : GdataAtom.atom_textConstruct;
      ce_category : GdataAtom.atom_category;
      ce_extensions : GdataCore.xml_data_model list
    }

    let empty = {
      ce_etag = "";
      ce_authors = [];
      ce_content = GdataAtom.empty_content;
      ce_contributors = [];
      ce_id = "";
      ce_published = GdataDate.epoch;
      ce_updated = GdataDate.epoch;
      ce_links = [];
      ce_title = GdataAtom.empty_text;
      ce_category = GdataAtom.empty_category;
      ce_extensions = []
    }

    let to_xml_data_model entry =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.render_element_list (GdataAtom.render_author "author") entry.ce_authors;
         GdataAtom.render_content entry.ce_content;
         GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.ce_contributors;
         GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.ce_id;
         GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.ce_published;
         GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.ce_updated;
         GdataAtom.render_element_list Link.to_xml_data_model entry.ce_links;
         GdataAtom.render_text_construct "title" entry.ce_title;
         GdataAtom.render_category entry.ce_category;
         entry.ce_extensions]

    let of_xml_data_model entry tree =
      match tree with
          GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "etag"; `Namespace ns],
             GdataCore.Value.String v) when ns = GdataAtom.ns_gd ->
            { entry with ce_etag = v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "author"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.parse_author
              GdataAtom.empty_author
              (fun author -> { entry with ce_authors =
                                 author :: entry.ce_authors })
              cs
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "content"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.parse_content
              GdataAtom.empty_content
              (fun content -> { entry with ce_content = content })
              cs
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "contributor"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              GdataAtom.parse_author
              GdataAtom.empty_author
              (fun contributor -> { entry with ce_contributors =
                                      contributor :: entry.ce_contributors })
              cs
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "id"; `Namespace ns],
             [GdataCore.AnnotatedTree.Leaf
                ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
            { entry with ce_id = v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "published"; `Namespace ns],
             [GdataCore.AnnotatedTree.Leaf
                ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
            { entry with ce_published = GdataDate.of_string v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "updated"; `Namespace ns],
             [GdataCore.AnnotatedTree.Leaf
                ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
            { entry with ce_updated = GdataDate.of_string v }
        | GdataCore.AnnotatedTree.Node
            ([`Element; `Name "link"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
            Link.of_xml_data_model
            Link.empty
            (fun link -> { entry with ce_links = link :: entry.ce_links })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "title"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_text
            GdataAtom.empty_text
            (fun title -> { entry with ce_title = title })
            cs
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "category"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            GdataAtom.parse_category
            GdataAtom.empty_category
            (fun category -> { entry with ce_category = category })
            cs
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name _; `Namespace ns],
           _) when ns = Xmlm.ns_xmlns ->
          entry
      | extension ->
          let extensions = extension :: entry.ce_extensions in
            { entry with ce_extensions = extensions }

  end

  module Feed = GdataAtom.MakeFeed(Entry)(Link)

  type comments = {
    c_countHint : int;
    c_href : string;
    c_readOnly : bool;
    c_rel : string;
    c_commentFeed : Feed.t
  }

  let empty_comments = {
    c_countHint = 0;
    c_href = "";
    c_readOnly = false;
    c_rel = "";
    c_commentFeed = Feed.empty
  }
  (* END Comment data types *)


  (* Comment feed: parsing *)
  let parse_commentsFeedLink link tree =
    match tree with
        GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "countHint"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_countHint = int_of_string v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "href"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_href = v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "readOnly"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_readOnly = bool_of_string v }
      | GdataCore.AnnotatedTree.Leaf
          ([`Attribute; `Name "rel"; `Namespace ns],
           GdataCore.Value.String v) when ns = "" ->
          { link with c_rel = v }
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            Feed.of_xml_data_model
            Feed.empty
            (fun feed -> { link with c_commentFeed = feed })
            cs
      | e ->
          GdataUtils.unexpected e

  let parse_comments comments tree =
    match tree with
      | GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feedLink"; `Namespace ns],
           cs) when ns = GdataAtom.ns_gd ->
          GdataAtom.parse_children
            parse_commentsFeedLink
            empty_comments
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e

  let parse_comment_entry tree =
    let parse_root tree =
      match tree with
          GdataCore.AnnotatedTree.Node
            ([`Element; `Name "entry"; `Namespace ns],
             cs) when ns = GdataAtom.ns_atom ->
            GdataAtom.parse_children
              Entry.of_xml_data_model
              Entry.empty
              Std.identity
              cs
        | e ->
            GdataUtils.unexpected e
    in
      parse_root tree
  (* END Comment feed: parsing *)


  (* Comment: rendering *)
  let render_commentsFeedLink link =
    GdataAtom.render_element GdataAtom.ns_gd "feedLink"
      [GdataAtom.render_int_attribute "" "countHint" link.c_countHint;
       GdataAtom.render_attribute "" "href" link.c_href;
       GdataAtom.render_bool_attribute "" "readOnly" link.c_readOnly;
       GdataAtom.render_attribute "" "rel" link.c_rel;
       Feed.to_xml_data_model link.c_commentFeed]

  let render_comments comments =
    GdataAtom.render_element GdataAtom.ns_gd "comments"
      [render_commentsFeedLink comments]

  let comment_entry_to_data_model entry =
    let entry_element =
      GdataAtom.render_element GdataAtom.ns_atom "entry"
        [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
         GdataAtom.render_attribute Xmlm.ns_xmlns "gd" GdataAtom.ns_gd;
         GdataAtom.render_attribute Xmlm.ns_xmlns "app" GdataAtom.ns_app;
         (* TODO:
         GdataAtom.render_attribute Xmlm.ns_xmlns "gCal" GdataCalendar.ns_gCal;
          *)
         Entry.to_xml_data_model entry]
    in
      List.hd entry_element
  (* END Calendar comment: rendering *)
end

